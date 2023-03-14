# GitHub Action to `aws s3 cp` a file to an S3 or form S3 Bucket 🔄 

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
      - uses: papac/action-s3-cp@v0.1
        env:
          AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: 'eu-west-1'
          SOURCE: 'CHANGELOG.md'
          DESTINATION: '/path/changelogs/CHANGELOG.android.md'
```


### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `FROM` | Define the orientation of action between upload or download. If is set `local` we copy file from local to s3 and if is set `s3` we download file from s3 to local. The default value is `s3` | `env` | **NO** |
| `SOURCE` | The local or remote. | `env` | **Yes** |
| `DESTINATION` | The local or remote. | `env` | **Yes** |
| `AWS_REGION` | The region where you created your bucket in. For example, `eu-central-1`. [Full list of regions here.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions) | `env` | **Yes** |
| `AWS_S3_BUCKET` | The name of the bucket you're cp to. For example, `golang-deployment-bucket`. | `env` | **Yes** |
| `AWS_ACCESS_KEY_ID` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `env` | **Yes** |


## License

This project is distributed under the [MIT license](LICENSE.md).
