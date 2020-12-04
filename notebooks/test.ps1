[int]$script:ConnectToConnectionTryCounters = 0

function Connect-ThirdPartyServer ([string]$ComputerName) {
   
    [int]$script:ConnectToConnectionTryCounters += 1

    # Connect Succesfully every second time
    if ($script:ConnectToConnectionTryCounters % 2 -eq 0) {
        Write-Information "🟢 Succesfully connected to Server $ComputerName"
    } else {
        throw [System.ServiceModel.ServerTooBusyException]::New(('🔴 Server {0} is currently too busy to connect' -f $ComputerName)) 
    }
}

function Start-MemoryHungryFunction {
    Write-Information "Calculating Infinity..."
    Start-Sleep -Seconds 1.0
    throw [System.InsufficientMemoryException]::New()
}
