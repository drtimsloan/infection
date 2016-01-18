
# Infection prediction function - documentation
# Tim Sloan 18-01-16

## Purpose

This tool is designed to predict the risk of infection based on the proportion
of dangerous bacteria (pathogens) to the proportion of harmless bacteria (commensals)
from the wound or other body site being tested. The prediction tool is not scientifically
validated in any way and is for simulation purposes only!
    
When the proportion of pathogenic bacteria is low, they are unable to outgrow the
harmless bacteria and the risk of an uncontrolled infection is low. At higher proportions
of pathogenic bacteria, this risk increases, until a life-threatening infection (sepsis)
becomes a very likely outcome. Reducing the strength of the immune system further increases
the risk of infection by modifying the growth rate of pathogenic bacteria.


## Input values
    
Percentage of pathogenic bacteria - on a slider from 0 to 100
Number of days to simulate over - radio checkboxes from 1 to 3 days
Strength of the immune system - High, Medium or Low


## Output display

The plot displays the proportion of pathogenic and commensal bacteria as they change
over time. As the growth data are simulated using a poisson distribution, the outcome
varies slightly every time it is calculated for given input values. If the final proportion
of pathogenic bacteria is over 50 %, high risk of infection is reported. If the proportion
reaches 100 %, a likely outcome of life-threatening sepsis is reported.
