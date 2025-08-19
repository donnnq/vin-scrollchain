// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

import "./BlessingLedger.sol";

contract AuditBroadcastDeck {
    BlessingLedger public ledger;
    address public steward;
    string public broadcastMessage;

    constructor(address _ledgerAddress, address _steward) {
        ledger = BlessingLedger(_ledgerAddress);
        steward = _steward;
    }

    function generateBroadcast() public {
        uint256 resonance = ledger.totalResonance();
        if (resonance >= 888) {
            broadcastMessage = "Steward qualifies for exemption. Civic resonance verified. Dynasty-neutral.";
        } else {
            broadcastMessage = "Steward under review. Additional blessings required.";
        }
    }

    function viewBroadcast() public view returns (string memory) {
        return broadcastMessage;
    }
}
