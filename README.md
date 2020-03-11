# GitHub Action to `aws s3 cp` a file to an S3 Bucket 🔄 

This simple action uses the [vanilla AWS CLI](https://docs.aws.amazon.com/cli/index.html) to cp a file (either from your repository or generated during your workflow) to a remote S3 bucket.



## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```
name: Upload CHANGELOG to S3

on:
  push:
    branches:
      - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: qoqa/action-s3-cp@v1.0.0
        env:
          AWS_S3_BUCKET: ${{ secrets.CHANGELOG_AWS_S3_BUCKET }}
          AWS_ACCESS_KEY_ID: ${{ secrets.CHANGELOG_AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.CHANGELOG_AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: 'eu-west-1'
          AWS_S3_PATH: '/changelogs/CHANGELOG.android.md'
          FILE: 'CHANGELOG.md'
```


### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `FILE` | The local file you wish to upload to S3. For example, `./myfile.txt`. | `env` | **Yes** |
| `AWS_S3_PATH` | The remote file on S3. For example, `/path/myfile.txt`. | `env` | **Yes** |
| `AWS_REGION` | The region where you created your bucket in. For example, `eu-central-1`. [Full list of regions here.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions) | `env` | **Yes** |
| `AWS_S3_BUCKET` | The name of the bucket you're cp to. For example, `golang-deployment-bucket`. | `env` | **Yes** |
| `AWS_ACCESS_KEY_ID` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |


## License

This project is distributed under the [MIT license](LICENSE.md).
