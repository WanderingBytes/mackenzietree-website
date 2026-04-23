#!/bin/bash
# Download MacKenzie Tree LLC Facebook photos
DEST="/Users/mikhail/Documents/Mackenzietree/images/real"
mkdir -p "$DEST"

download() {
  local url="$1"
  local filename="$2"
  echo "Downloading $filename..."
  curl -sL --max-time 30 \
    -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36" \
    -H "Referer: https://www.facebook.com/" \
    "$url" -o "$DEST/$filename"
  local size=$(stat -f%z "$DEST/$filename" 2>/dev/null || echo 0)
  if [ "$size" -gt 5000 ]; then
    echo "  ✅ $filename ($size bytes)"
  else
    echo "  ❌ $filename failed or too small"
    rm -f "$DEST/$filename"
  fi
}

download "https://scontent-mia5-1.xx.fbcdn.net/v/t39.30808-6/669023095_1551575606400447_1743235694954669392_n.jpg?stp=cp6_dst-jpegr_tt6&_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=vyTsBs0awkAQ7kNvwGvvm3F&oh=00_Af3yjaaxNQR_cvNPBPwOVRYtQJQFgc3tqjzd9q3K7dek4Q&oe=69EF0714" "fb-job-site-01.jpg"
download "https://scontent-mia5-1.xx.fbcdn.net/v/t39.30808-6/487298148_1237363151155029_371671629235927235_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=104&ccb=1-7&_nc_sid=2a1932&_nc_ohc=VozvVyHZ_88Q7kNvwE9H-3o&oh=00_Af0SQ0Blr1sz9mDLLjpJeuL8Gima1m4cnJBPQUXHxX2tRg&oe=69EEFAED" "fb-job-site-02.jpg"
download "https://scontent-mia5-1.xx.fbcdn.net/v/t39.30808-6/487162066_1236588804565797_466447682383780925_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=n-gkRMhYe6sQ7kNvwHecPn8&oh=00_Af0FC3VNXl_9VjPYj2TYImMjYm94LZl4gaJKuqbxnWNUag&oe=69EF0C29" "fb-job-site-03.jpg"
download "https://scontent-mia3-1.xx.fbcdn.net/v/t39.30808-6/473421968_3484512628509067_4116892874412386405_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=7b2446&_nc_ohc=YA827C2ZrOIQ7kNvwEBhE2B&oh=00_Af11KWLdKBCr7PDoYh55M2gtnQ-GNuFx7fakJCHnrECheQ&oe=69EF1657" "fb-job-site-04.jpg"
download "https://scontent-mia3-3.xx.fbcdn.net/v/t39.30808-6/472571336_3482335008726829_3912863440557018393_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7b2446&_nc_ohc=PZjYJianedIQ7kNvwF4C_kj&oh=00_Af1CSk4bFrIxJNC8q0ZXKZ1cpbZFI_1QcPN6p8fRc2gTnw&oe=69EF2B7C" "fb-job-site-05.jpg"
download "https://scontent-mia3-1.xx.fbcdn.net/v/t39.30808-6/473041080_3482334778726852_4106206747671165167_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=7b2446&_nc_ohc=uwVwH8LHwNEQ7kNvwF_qBYW&oh=00_Af0vJnFmPexnso8hCFyjsg1ogUFTMVFegjfSAAM5OCjpPw&oe=69EF2AD3" "fb-job-site-06.jpg"
download "https://scontent-mia3-1.xx.fbcdn.net/v/t39.30808-6/473015696_3482335028726827_7020423840733049242_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=7b2446&_nc_ohc=eL0yQeT3DLUQ7kNvwEGta4b&oh=00_Af3sRRJ1tnpEgsya8YxvyBYNQGi9CRk8K3eIId4cakKyAA&oe=69EF1921" "fb-job-site-07.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/473036849_3482334782060185_473208440017702597_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=sgBW8rx7XsIQ7kNvwG2U6Ie&oh=00_Af13BNXIHFlfzn3dq1rQqduGbWwV3t9E7f0VJHGfdhXTTw&oe=69EF2248" "fb-job-site-08.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472066894_3479573799002950_1763007870943625447_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=b4wZBnBHkk8Q7kNvwFBTwDy&oh=00_Af1z0gpiGzexjzIZJPxSDdCsxvKCAGdAUdxLr4vWQkllnw&oe=69EF33EA" "fb-job-site-09.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472579838_3478987185728278_145773982890135864_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=NV9cNv00bvcQ7kNvwFwk8c7&oh=00_Af3BaU-O05wei6u8TxqDBWJJzvKEhpuiHVa1aoCEp2C2kA&oe=69EF1E50" "fb-job-site-10.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472768379_3478987159061614_7787156457371398509_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=YLO1fSzj-fwQ7kNvwF-eja_&oh=00_Af2fyn5SZF9KjompPzSg011xp62Bk3cTDmsD5aVhj-n8KA&oe=69EF1CEC" "fb-job-site-11.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472747104_3478987129061617_8985641507779118056_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7b2446&_nc_ohc=gkNqDrpn6soQ7kNvwHRnRjm&oh=00_Af2_d767pTKQOicx5cBxv1PoDfhBuSMZhGzoGEFg6cvv9A&oe=69EF2227" "fb-job-site-12.jpg"
download "https://scontent-mia3-3.xx.fbcdn.net/v/t39.30808-6/472653671_3478987125728284_4867842153446368236_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7b2446&_nc_ohc=LjgGy1KEobcQ7kNvwFm2kKn&oh=00_Af0Zn_nKBwvbnpisv_8ggyngod-VfNe9CSabwPfhOyLiaA&oe=69EF278C" "fb-job-site-13.jpg"
download "https://scontent-mia3-1.xx.fbcdn.net/v/t39.30808-6/472335640_3478987192394944_2584691367194228153_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=7b2446&_nc_ohc=H28e0BOw_DgQ7kNvwHPTbEg&oh=00_Af0hAA1eXCtLl3FKlTmvzgMwwaN1hfEQhNj3ocodwuvyXA&oe=69EF09BD" "fb-job-site-14.jpg"
download "https://scontent-mia5-2.xx.fbcdn.net/v/t39.30808-6/472693533_3478987222394941_2342376209473103576_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=7b2446&_nc_ohc=MBP-ZWpj5hMQ7kNvwF6WChc&oh=00_Af1WKIz4iaOwERc_YDWQQSskvbO2QAhuA7d2uUfn-z_WpA&oe=69EF1449" "fb-job-site-15.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472799610_3478987142394949_8839627141999961152_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7b2446&_nc_ohc=OLcmH4EULRwQ7kNvwFiRFFc&oh=00_Af1yXs3jBvVtwf6GQ3dJup_Uk_67xl5sXPKJEYVso5SXQQ&oe=69EF338D" "fb-job-site-16.jpg"
download "https://scontent-mia3-1.xx.fbcdn.net/v/t39.30808-6/472336947_3478987115728285_9140315513503173136_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=7b2446&_nc_ohc=zgheWo0AJ8cQ7kNvwH6hdcf&oh=00_Af28ehBmK3weOD2HJB3DdaJzH3Z0kWULBaGwweqTsAEfgQ&oe=69EF0439" "fb-job-site-17.jpg"
download "https://scontent-mia5-1.xx.fbcdn.net/v/t39.30808-6/472283548_3478987109061619_1808183338881671973_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=jiYYeFDcgVQQ7kNvwEHacb7&oh=00_Af289_GKQzEK8IxZ0DVMiP8Er2yLv0TgBPccqB6LVSOf_Q&oe=69EF2079" "fb-job-site-18.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472860991_3478987165728280_1165834536732772827_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7b2446&_nc_ohc=9Sh-Wqyniu0Q7kNvwHWTPpn&oh=00_Af2zA5KIRV4qDpLj8HZk-9Xlm3jrDR02F3oQLCltaNa0Vg&oe=69EF1A1E" "fb-job-site-19.jpg"
download "https://scontent-mia3-3.xx.fbcdn.net/v/t39.30808-6/472721011_3478986919061638_645440342199520786_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7b2446&_nc_ohc=bAr02_8bkOIQ7kNvwHexNwp&oh=00_Af1Pi7goAK9DFMj6WardUac0DOdClsvKUWz9-Mz3UpCyTw&oe=69EF304D" "fb-job-site-20.jpg"
download "https://scontent-mia3-3.xx.fbcdn.net/v/t39.30808-6/472442395_3478987112394952_6114325237144801129_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=7b2446&_nc_ohc=DC1E6Ph-QPUQ7kNvwGISaYk&oh=00_Af3Wq-7eT-qt54AqJKb3sN4GPvcDtJLHqg1iek8-KKxZOA&oe=69EF280D" "fb-job-site-21.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472767469_3478986799061650_8965436614403487300_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=8gSmb2V-S7EQ7kNvwF5OQ29&oh=00_Af3xCPWsd4JlFIJAy-VU7007t9-BMm7t3VZX8qa9xvzMpw&oe=69EF0A59" "fb-job-site-22.jpg"
download "https://scontent-mia3-2.xx.fbcdn.net/v/t39.30808-6/472409310_3478987122394951_4736036966329406473_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=7b2446&_nc_ohc=Znaov2mu9sAQ7kNvwHm9fVW&oh=00_Af19rYc8xIHD2smh2ScDjXHN6J6SqmqpVM42G9kXwIFcig&oe=69EF0FF3" "fb-job-site-23.jpg"
download "https://scontent-mia5-1.xx.fbcdn.net/v/t39.30808-6/472636538_3478987169061613_9023343798513696028_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7b2446&_nc_ohc=CHGFb-Vf4BgQ7kNvwFXPkHY&oh=00_Af11ozwbS0Z2gXia3zhuXllgBWxEq5sk29jssb3fAQkLsg&oe=69EF084D" "fb-job-site-24.jpg"
download "https://scontent-mia5-1.xx.fbcdn.net/v/t1.6435-9/186327203_2578973822396290_2561712285946453573_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=7b2446&_nc_ohc=Jot977XpZpMQ7kNvwETA2J6&oh=00_Af0cC7BwvhoACP7BEI5sshxAOxjnebnpp7ymybKCBahicA&oe=6A10BD1F" "fb-job-site-25.jpg"

echo ""
echo "=== Results ==="
ls -lh "$DEST"/fb-job-site-*.jpg 2>/dev/null | awk '{print $5, $9}' | sed "s|$DEST/||"
total=$(ls "$DEST"/fb-job-site-*.jpg 2>/dev/null | wc -l | tr -d ' ')
echo "Total downloaded: $total / 25"
