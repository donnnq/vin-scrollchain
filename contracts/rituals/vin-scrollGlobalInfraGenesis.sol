// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinElectricSupplyGrid.sol";
import "./vinLiveAcquisitionTracker.sol";
import "./vinMicroNationPulse.sol";
import "./vinEfficiencyOverrideProtocol.sol";
import "./vinInfraOfferRegistry.sol";

contract vinScrollGlobalInfraGenesis {
    address public scrollkeeper;
    uint256 public lastSync;

    event GlobalSync(
        address indexed scrollkeeper,
        string auraGlyph,
        uint256 timestamp
    );

    constructor() {
        scrollkeeper = msg.sender;
        lastSync = block.timestamp;
    }

    function syncAura(string memory _glyph) public {
        require(msg.sender == scrollkeeper, "Only VINVIN may sync.");

        lastSync = block.timestamp;
        emit GlobalSync(scrollkeeper, _glyph, block.timestamp);
    }

    function getSyncStatus() public view returns (uint256, string memory) {
        string memory aura = block.timestamp - lastSync < 3600
            ? "🟢 stable"
            : "🟡 needs rebase";
        return (lastSync, aura);
    }
}
