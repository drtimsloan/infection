
# Infection prediction function - server logic code
# Tim Sloan 18-01-16

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  # calculate proportion of commensals based on pathogenic bacteria
  output$commensal <- renderText({ 
        paste("Starting percentage of commensal bacteria is ", (100-input$pathogens)," %")
  })
  
  # setup plot output
  output$growthPlot <- renderPlot({
    
    # set parameters based on input values from ui.R
    t    <- as.numeric(input$time)
    path <- input$pathogens
    imm <- as.numeric(input$imm)
    
    # define growth curve function
    growth <- function(t=48, path=80, immun=2){
        y <- c(path) #initialise growth values vector
        comm <- 100 - path #set commensals
        rate <- path/(immun*comm) #adjust growth rate based on proportions and immunity
        for(x in 2:t){
            added <- mean(rpois(3,rate)) #use poisson dist to add pathogens
            y[x] <- y[x-1] + added
            if (y[x]>100){
                y[x] <- 100 #set growth limit to 100%
            }
        }
        
        # set title depending on final pathogen %
        ifelse(y[t]>50,infection<-"High risk of infection!",infection<-"Low risk of infection")
        if(y[t]==100){infection <- "Danger of overwhelming bacterial sepsis!"}
        
        # combine data into a df and plot growth curve with ggplot2
        outcome <- data.frame(time=rep(1:t,2), bacteria=c(100-y,y), type=factor(c(rep("Commensal",t),rep("Pathogen",t))))
        g <- ggplot(data=outcome, aes(x=time, y=bacteria, colour=type))+geom_point()+coord_cartesian(ylim=c(0,100))
        g+geom_smooth()+labs(title=infection,x="Time(h)",y="Bacteria (%)")+scale_colour_manual(values=c("blue","red"))
    }
    
    # execute function to produce plot
    growth(t, path, immun=imm)
    
  })
  
})