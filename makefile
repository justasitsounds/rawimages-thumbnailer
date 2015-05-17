all:: zip

clean:
	rm -f CreateThumbnail.zip

zip:
	zip -r CreateThumbnail.zip CreateThumbnail.js node_modules/

update:
	aws lambda update-function-code --function-name CreateThumbnail --zip-file fileb:///Users/james/dev/rawimages-thumbnailer/CreateThumbnail.zip

invoke:
	aws lambda invoke --invocation-type Event --function-name CreateThumbnail --region us-west-2 --payload file:///Users/james/dev/rawimages-thumbnailer/input.txt outputfile.txt