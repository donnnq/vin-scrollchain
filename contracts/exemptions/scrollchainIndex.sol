// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

import "./performanceBundle/BlessingLedger.sol";
import "./performanceBundle/AuditBroadcastDeck.sol";
import "./CivicSanctumRegistry.sol";
import "./performanceBundle/resonanceTracker.sol";

contract ScrollchainIndex {
    address public steward;
    BlessingLedger public ledger;
    AuditBroadcastDeck public broadcastDeck;
    CivicSanctumRegistry public registry;
    ResonanceTracker public tracker;

    constructor(
        address _steward,
        address _ledger,
        address _broadcastDeck,
        address _registry,
        address _tracker
    ) {
        steward = _steward;
        ledger = BlessingLedger(_ledger);
        broadcastDeck = AuditBroadcastDeck(_broadcastDeck);
        registry = CivicSanctumRegistry(_registry);
        tracker = ResonanceTracker(_tracker);
    }

    function fullStatusReport() public view returns (
        uint256 totalResonance,
        bool isExempt,
        bool dynastyNeutral,
        string memory broadcastMessage
    ) {
        totalResonance = ledger.totalResonance();
        isExempt = registry.viewSteward(steward).isExempt;
        dynastyNeutral = registry.viewSteward(steward).dynastyNeutral;
        broadcastMessage = broadcastDeck.viewBroadcast();
    }

    function isLegendarySteward() public view returns (bool) {
        return tracker.isLegendary(steward);
    }
}
