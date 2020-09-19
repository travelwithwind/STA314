library(jpeg) # for reading image file as arrary, writing array as image
library(imager) # for reading image as image
library(ggplot2) 

rm(list = ls())
img <- readJPEG("my gf.jpg") # Read the image

# turn it into 2d
img.squeeze <- img
dim(img.squeeze) <- c(dim(img.squeeze)[1]*dim(img.squeeze)[2], dim(img.squeeze)[3]) 

# k means cluster
kClusters <- 4
kMeans <- kmeans(img.squeeze, centers = kClusters, nstart = 20)
img.new <- kMeans$centers[kMeans$cluster,]
dim(img.new) <-c(dim(img))

# save image
writeJPEG(img.new,"new_image.jpg")

# plot image
par(mfrow=c(1,2))
img_original = imager::load.image("my gf.jpg")
plot(img_original, main = "original", axes=F)
img_new = imager::load.image("new_image.jpg")
plot(img_new, main = "kMeans", axes=F)


# Scree Plot
error = NULL
k.range = 1:10
for (k in k.range){
  error <- append(error, kmeans(img.squeeze, centers = k, nstart = 1)$tot.withinss)
}

data.frame(k.range = k.range, error = error)  %>%
ggplot(aes(x = k.range, y = error)) + geom_point()+
  labs(title = "Scree Plot") +
  xlab("Number of Clusters") +
  ylab("Withwin groups sum of square") +
  theme_classic()