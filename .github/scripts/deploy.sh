set -eux

get_cloudfront_distribution_id() {
  aws ssm get-parameter --name f-development-digit-recog-cloudfront-distribution-id --region us-west-2| jq -r '.Parameter.Value'
}

CLOUDFRONT_DISTRIBUTION=$(get_cloudfront_distribution_id)

if [ -z $CLOUDFRONT_DISTRIBUTION ]; then
  echo Cloudfront does not exist!
  exit 1
fi

BUCKET=s3://f-development-digit-recog-static
aws s3 rm $BUCKET --recursive
aws s3 cp html $BUCKET --recursive
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION --paths "/*"