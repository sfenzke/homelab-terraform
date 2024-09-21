terraform {
    backend "s3" {
        bucket = "tfstate"
        endpoints = {
            s3 = "http://192.168.7.4:9000"
        }
        key = "homelab.tfstate"

        access_key = "QRBeFHrFeHiGRpP5PH56"
        secret_key = "unjvgZlPUoPB9KltjksdVNIneJB4w6frrArpl1Bj"
    
        region = "main"
        skip_credentials_validation = true  # Skip AWS related checks and validations
        skip_requesting_account_id = true
        skip_metadata_api_check = true
        skip_region_validation = true
        use_path_style = true
    }
}