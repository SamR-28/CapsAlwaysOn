Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class KeyboardHelper {
    [DllImport("user32.dll")]
    public static extern short GetKeyState(int nVirtKey);
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
}
"@

while ($true) {
    # Check if Caps Lock is off
    if (-not ([KeyboardHelper]::GetKeyState(0x14) -band 1)) {
        # Simulate pressing and releasing Caps Lock to turn it back on
        [KeyboardHelper]::keybd_event(0x14, 0, 0, 0)
        [KeyboardHelper]::keybd_event(0x14, 0, 2, 0)
    }
    Start-Sleep -Milliseconds 20
}

# SIG # Begin signature block
# MIIFcwYJKoZIhvcNAQcCoIIFZDCCBWACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQURsWMNXL0CwR51qYGkazZHKB7
# lgqgggMMMIIDCDCCAfCgAwIBAgIQYWZebVeKNbBC50AdQ5LFSTANBgkqhkiG9w0B
# AQsFADAcMRowGAYDVQQDDBFNeUNvZGVTaWduaW5nQ2VydDAeFw0yNDExMjgyMjEy
# MjNaFw0yNTExMjgyMjIyMjRaMBwxGjAYBgNVBAMMEU15Q29kZVNpZ25pbmdDZXJ0
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnzlQzZdLGDe5tNcU6lDo
# IkC+OyYfLPLVwNVgkhGAEvLWxxnyPzIZE+7BdG0/inGbN/LByu3lFhWvVoAzLy19
# 1JgE3TNCF1A+sRrx2vldkgVdr50gNgwwu3swVqpV6azBL3nq/dpMIS7v92RBX6+6
# mnyP8d/2+N3H/pDFxWiFE6OPXlLTxrNyHrREzLF3Ih4S4NBCQe+8F6sNkqGOa48y
# 31w1oqPeIvQgGgTQ6DBaKYLEk2ZvhvmFbe8AoI3uW+mD15riNUcG0oiR47ozJrZy
# DdjUE8WtAdtGsshiubNtP4rJ+yvw4tljlN9/evtMUT7yp6iXVW6PVuxyPCTa19vU
# xQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMw
# HQYDVR0OBBYEFPYGIB3TCPe01GxEqJsVwIuT/z3DMA0GCSqGSIb3DQEBCwUAA4IB
# AQBgwgqPnqFbugPlgaNQuk5nsV8WSAo0yq4HYY/e4jnrymgc7G8lcIgtO+GGSU5o
# qIF+RgfRywsOt2Yl6ABElHOb+VPHl8nJHa39eqchefi+ZpKUjuph1BfWTM38nY8a
# ToEciwEVxgWpimTDp5xZMfTmoRJt7fGft9RXJLfCnj3zFenOQfxIzfKavzH6FfNs
# 7a19kTypYvVuYdr9QzYB2bmWYIqVqboxnut1cAgzHu9w/fZW/6/krJmuCPOlk1qQ
# xKxOgNKij3Rke1CLunxocoX7kAN2ukvvvo8x89DK24hgwZv3Ity3kThEOPPc5UAf
# Kj1fdVCQNDMCmod3mHLuo1iwMYIB0TCCAc0CAQEwMDAcMRowGAYDVQQDDBFNeUNv
# ZGVTaWduaW5nQ2VydAIQYWZebVeKNbBC50AdQ5LFSTAJBgUrDgMCGgUAoHgwGAYK
# KwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU
# JGcKssm8A4zk964VnxXdvHerOfswDQYJKoZIhvcNAQEBBQAEggEAafz5wAM9KTTX
# 4h4VObAICCTo+0GybqH0zdLa3LpwFPiEo1/T67rArAdau1hfHtjt6J9Fe2vXeDfR
# YBWrENR9MXw+gOsEiKwXzhk4nX/u2Z470x65qpok9hM8guot+chNkvN2pVGs6XkE
# OGB3aWVUo5D4YHHAFLpqeEswIuSB2P5AUCfgS7rGqBymUpcg1DxjPlHQrPE8yMmM
# YjkNpvSBSJ2nn00Pdql3eXFxmeAR/ff1La2bji3/aRjeyTO0r/AbYmpRzgaJsODh
# Qqvhzo1df5pUXrUlentWARygpdkWAuCCEM6uyVereyfKPBtonWiRNm/CrcvbzRwV
# GOWcnoBlhw==
# SIG # End signature block
