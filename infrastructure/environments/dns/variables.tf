variable "provider_url" {
  type = string
  default = "192.168.20.50:880"
}

variable "provider_username" {
  type = string
  default = "simen"
}

variable "provider_key" {
  type = string
  sensitive = true
}

variable "rewrites" {
  type = list(object({
    domain = string
    answer = string
  }))
  default = [
    {
      domain = "vpn.simenmo.com"
      answer = "vpn.simenmo.com"
    },
    {
      domain = "pve-1.simenmo.com"
      answer = "192.168.20.220"
    },
    {
      domain = "*.simenmo.com"
      answer = "192.168.20.50"
    },
  ]
}

variable "allowlists" {
  type = list(object({
    name = string
    url  = string
  }))
  default = []
}

variable "blocklists" {
  type = list(object({
    name = string
    url  = string
  }))
  default = [
  {
    name = "AdGuard DNS filter"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
  },
  {
    name = "AdGuard DNS Popup Hosts filter"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt"
  },
  {
    name = "HaGeZi's Samsung Tracker Blocklist"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_61.txt"
  },
  {
    name = "HaGeZi's Xiaomi Tracker Blocklist"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_60.txt"
  },
  {
    name = "HaGeZi's Windows/Office Tracker Blocklist"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_63.txt"
  },
  {
    name = "HaGeZi's Threat Intelligence Feeds"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_44.txt"
  },
  {
    name = "NOR: Dandelion Sprouts nordiske filtre"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_13.txt"
  },
  {
    name = "Phishing URL Blocklist (PhishTank and OpenPhish)"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt"
  },
  {
    name = "HaGeZi's The World's Most Abused TLDs"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_56.txt"
  },
  {
    name = "Malicious URL Blocklist (URLHaus)"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"
  },
  {
    name = "Scam Blocklist by DurableNapkin"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_10.txt"
  },
  {
    name = "uBlock₀ filters – Badware risks"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt"
  },
  {
    name = "Stalkerware Indicators List"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_31.txt"
  },
  {
    name = "The Big List of Hacked Malware Web Sites"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
  },
  {
    name = "NoCoin Filter List"
    url  = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_8.txt"
  }
]
}

