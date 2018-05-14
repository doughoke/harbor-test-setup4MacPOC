curl -i -k -u admin:Harbor12345 http://localhost/service/token?account=admin\&service=harbor-registry\&scope=repository:library/mysql/5.6.35:pull,push


curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ /
  "project_name": "test-project", /
  "metadata": { /
    "public": 0, /
    "enable_content_trust": true, /
    "prevent_vulnerable_images_from_running": true, /
    "prevent_vulnerable_images_from_running_severity": "MEDIUM", /
    "automatically_scan_images_on_push": true /
  } /
}' 'http://localhost/api/projects'


curl -k -v -H "Content-Type: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjU3UUI6VUxSQzpKWExXOkFKQkg6TFVVNzpSRklXOlFTWlE6MjJEWTpSTDVPOkczWFU6RVQ2NzpNQkxSIn0.eyJpc3MiOiJoYXJib3ItdG9rZW4taXNzdWVyIiwic3ViIjoiYWRtaW4iLCJhdWQiOiJoYXJib3ItcmVnaXN0cnkiLCJleHAiOjE1MjYxNzE3MTUsIm5iZiI6MTUyNjE2OTkxNSwiaWF0IjoxNTI2MTY5OTE1LCJqdGkiOiJYUlpkZG9xZ1RZdVc2VWRJIiwiYWNjZXNzIjpbeyJ0eXBlIjoicmVwb3NpdG9yeSIsIm5hbWUiOiJsaWJyYXJ5L215c3FsLzUuNi4zNSIsImFjdGlvbnMiOlsicHVzaCIsIioiLCJwdWxsIl19XX0.cr2TqkA-i-08A_jOtRNZcRnCvmnaj8Q8ZMv3tjpDssQRYBfTFBeMUZjXpMPvo9q07zbupwJ1CSelJ_6_C6b68aPHY6hd9iklhd5OgmfXTJSTRSJ526b3isCnx2ebE8W254cN-l6z6j_f4K5wRhjBLLO3xWBAraMu2WYqtyFf29calNdK83qCu7r8TYKVZ19AKkk4zslSNZPPZkmINUY3K5B3ndekrXwnY1rs9q9y51_TFs9K-XTjm7G0vG8vzRK5zyhYkOk2zrDgO7WwG81b4tcXO4SOfJkihvGYLsNj92cD39PkTbg1v3OiLcQX6Pq8d1YOjvL_TM_OFqrBt9dBsk7LEI8RWMFLygbdNAjfiaF--YYJCOpuMLTyojWBdLssUqFJmJW9mF2rPnabKN_mW0eMzE6L_Ps360_UZS76llkvRfPk-7XKI7Qr-HG6ZALwIptNfegppNmdonnqCVKt7YxdWzXEXrO0wUvi-k72dPDFpl3CrAHXfE6yFW8bOwwQ8SYQU1lSoTPoyeu6i_ugpRkHgIECjXgZ6A5AeGCNJRZtawSGocAtnaKpkP4wu7JY6wahd1lDUJ1bNNwfHoK2ryi0RmeHye1sYfZyji_S1XNN4djMbfEHVz3m9pJd45Cxbpouf3yed0yJ7y7jjbuQs3pQbm_BvZObxB9id6AP4cA“ -X GET 'http://localhost/v2/library/mysql/5.6.35/manifests/latest'


http://localhost/api/

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "project_name": "test-project", "metadata": { "public": 0, "enable_content_trust": true, "prevent_vulnerable_images_from_running": true, "prevent_vulnerable_images_from_running_severity": "MEDIUM", "automatically_scan_images_on_push": true } }' 'http://localhost/api/projects'