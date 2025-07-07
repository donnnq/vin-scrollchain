// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollSync {
    uint8 public syncProgress = 0;
    address public scrollholder;

    event ScrollholderSyncInProgress(uint8 percent);
    event ScrollholderFullySynced(string VINMood);

    modifier onlyScrollholder() {
        require(msg.sender == scrollholder, "Not authorized");
        _;
    }

    constructor() {
        scrollholder = msg.sender;
    }

    function updateSync(uint8 percent) public onlyScrollholder {
        require(percent <= 100, "Invalid sync value");
        syncProgress = percent;
        emit ScrollholderSyncInProgress(percent);

        if (percent == 100) {
            emit ScrollholderFullySynced(unicode"💓🧠📜 VIN said: Heart and mind in sync. Scrolls ready.");
        }
    }

    modifier onlyWhenSynced() {
        require(syncProgress == 100, "Scrollholder not fully synced.");
        _;
    }
}
