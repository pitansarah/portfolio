# Description
# This coursework excerpts for Psy123a "Bayesian Statistical Modeling" (Professor: Dr. Liu, Brandeis University) demonstrates simulation. Template given by the Professor. 

# Research Question
# In a study, a researcher is interested in measure the stress level during a typical working day and they propose to use the hourly number of text messages one get during working hours as an indicator of stress level.

# Objective: Sequentially update posterior distribution of lambda up to participant 6. 
# Plot the sequential posterior lambda distributions.
# Evaluate: Does the order of the participants matter in terms of the final posterior distribution? 

# dependencies


# update posterior distribution of lambda up to participant 6 sequentially

  # calculate t, n, r, and s

      # r_post_seq = r + t
      s <- 25     
      r <- 5
      t <- 5
      n <-6
      r_post_seq <- r + (t*n)
      
      # s_post_seq
      y1_i <- 28
      y2_i <- 12
      y3_i <- 32
      y4_i <- 36
      y5_i <- 40
      y6_i <- 48
      
      s_post_seq1 <- s + y1_i
      s_post_seq2 <- s_post_seq1 + y2_i
      s_post_seq3 <- s_post_seq2 + y3_i
      s_post_seq4 <- s_post_seq3 + y4_i
      s_post_seq5 <- s_post_seq4 + y5_i
      s_post_seq6 <- s_post_seq5 + y6_i
      
      r_post_seq1 <- r + t
      r_post_seq2 <- r_post_seq1 + t
      r_post_seq3 <- r_post_seq2 + t
      r_post_seq4 <- r_post_seq3 + t
      r_post_seq5 <- r_post_seq4 + t
      r_post_seq6 <- r_post_seq5 + t
      
      cat('The sequential posterior distribution of lambda for participant 1 is Gamma(', s_post_seq1, ',', r_post_seq1, ').')
        cat('The sequential posterior distribution of lambda for participant 2 is Gamma(', s_post_seq2, ',', r_post_seq2, ').')
        cat('The sequential posterior distribution of lambda for participant 3 is Gamma(', s_post_seq3, ',', r_post_seq3, ').')
        cat('The sequential posterior distribution of lambda for participant 4 is Gamma(', s_post_seq4, ',', r_post_seq4, ').')
        cat('The sequential posterior distribution of lambda for participant 5 is Gamma(', s_post_seq5, ',', r_post_seq5, ').')
        cat('The sequential posterior distribution of lambda for participant 6 is Gamma(', s_post_seq6, ',', r_post_seq6, ').')
    
        
        
  cat(' sequential analysis of Participant 1 through 6 Data')
  
  data.frame(participant=1:6,
             data=c('Y = 28', 'Y = 12', 'Y = 32', 'Y = 36', 'Y = 40', 'Y = 48'),
              type=c(rep('posterior', 6)),
              model=c('Gamma(53, 10)', 'Gamma(65, 15)', 'Gamma(97, 20)', 'Gamma(133, 25)', 'Gamma(173, 30)', 'Gamma(221, 35)')
             )
  caption = 'Table: Sequential Posterior Update of Gamma Distribution (Lambda > 6), Participants 1 Through 6'

# plot posterior distribution of lambda up to participant 6 sequentially
# reference: https://moodle.brandeis.edu/pluginfile.php/482105/mod_label/intro/05b_SequentialAnalysis_F2026.html#(4)
  
  # posterior (participant 1)
  a<-plot_gamma(53, 35) +
    labs(title=bquote(''~lamda~ 'for participant 1'))
  
  # posterior (participant 2)
  b<-plot_gamma(65, 35) +
    labs(title=bquote(''~lamda~ 'for participant 2'))
  
  # posterior (participant 3)
  c<-plot_gamma(97, 35) +
    labs(title=bquote(''~lamda~ 'for participant 3'))

  # posterior (participant 4)
  d<-plot_gamma(133, 35) +
    labs(title=bquote(''~lamda~ 'for participant 4'))

  # posterior (participant 5)
  e<-plot_gamma(173, 35) +
    labs(title=bquote(''~lamda~ 'for participant 5'))
  
  # posterior (participant 6)
  f<-plot_gamma(221, 35) +
    labs(title=bquote(''~lamda~ 'for participant 6'))
  
  (a+b+c+d+e+f)+
    plot_annotation(title=' Sequential update of the parameter')

# Does the order of the participants matter in terms of the final posterior distribution? 
cat('The order of the participants does not matter in terms of the final posterior.')

