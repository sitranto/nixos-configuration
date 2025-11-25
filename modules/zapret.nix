{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    zapret
  ];
  
  services.zapret = {
    enable = true;
    whitelist = [
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtu.be"
      "googleapis.com"
      "cloudflare-ech.com"
      "encryptedsni.com"
      "cloudflareaccess.com"
      "cloudflareapps.com"
      "cloudflarebolt.com"
      "cloudflareclient.com"
      "cloudflareinsights.com"
      "cloudflareok.com"
      "cloudflarepartners.com"
      "cloudflareportal.com"
      "cloudflarepreview.com"
      "cloudflareresolve.com"
      "cloudflaressl.com"
      "cloudflarestatus.com"
      "cloudflarestorage.com"
      "cloudflarestream.com"
      "cloudflaretest.com"
      "dis.gd"
      "discord-attachments-uploads-prd.storage.googleapis.com"
      "discord.app"
      "discord.co"
      "discord.com"
      "discord.design"
      "discord.dev"
      "discord.gift"
      "discord.gifts"
      "discord.gg"
      "discord.media"
      "discord.new"
      "discord.store"
      "discord.status"
      "discord-activities.com"
      "discordactivities.com"
      "discordapp.com"
      "discordapp.net"
      "discordcdn.com"
      "discordmerch.com"
      "discordpartygames.com"
      "discordsays.com"
      "discordsez.com"
      "frankerfacez.com"
      "ffzap.com"
      "betterttv.net"
      "7tv.app"
      "7tv.io"
    ];
    params = [
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-autottl=2"
    ];
  };
}
