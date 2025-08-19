// SPDX-License-Identifier: Civic-OS-Restoration-Ledger-2025
pragma solidity ^0.8.19;

/**
 * @title vinGlobalRestorationLedger
 * @author Vinvin
 * @notice Logs planetary restoration events with emotional APR and civic resonance
 */

contract vinGlobalRestorationLedger {

    address public stewardCouncil;

    struct RestorationEvent {
        string title;
        string region;
        string partnerNation;
        string emotionalAPR; // e.g. "Trust: 93, Dignity: 95, Mythic Clarity: 90"
        string civicImpact;  // e.g. "Minors restored, treaties ratified, badges broadcast"
        uint timestamp;
    }

    RestorationEvent[] public events;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may log restoration events");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function logEvent(
        string memory _title,
        string memory _region,
        string memory _partnerNation,
        string memory _emotionalAPR,
        string memory _civicImpact
    ) public onlyCouncil {
        events.push(RestorationEvent({
            title: _title,
            region: _region,
            partnerNation: _partnerNation,
            emotionalAPR: _emotionalAPR,
            civicImpact: _civicImpact,
            timestamp: block.timestamp
        }));
    }

    function getEvent(uint _index) public view returns (
        string memory title,
        string memory region,
        string memory partnerNation,
        string memory emotionalAPR,
        string memory civicImpact,
        uint timestamp
    ) {
        RestorationEvent memory e = events[_index];
        return (
            e.title,
            e.region,
            e.partnerNation,
            e.emotionalAPR,
            e.civicImpact,
            e.timestamp
        );
    }

    function totalEvents() public view returns (uint) {
        return events.length;
    }
}
