// SPDX-License-Identifier: Civic-OS-Diplomatic-Pulse-2025
pragma solidity ^0.8.19;

/**
 * @title vinScrollchainDiplomaticPulse
 * @author Vinvin
 * @notice Tracks emotional APR and civic resonance across sovereign partners
 */

contract vinScrollchainDiplomaticPulse {

    address public stewardCouncil;

    struct DiplomaticPulse {
        string partnerName;
        string region;
        string emotionalAPR; // e.g. "Trust: 88, Dignity: 91, Mythic Clarity: 85"
        string civicMetric;  // e.g. "Restoration Rate: 72%, Badge Broadcasts: 18"
        uint timestamp;
    }

    DiplomaticPulse[] public pulses;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may log diplomatic pulses");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function logPulse(
        string memory _partnerName,
        string memory _region,
        string memory _emotionalAPR,
        string memory _civicMetric
    ) public onlyCouncil {
        pulses.push(DiplomaticPulse({
            partnerName: _partnerName,
            region: _region,
            emotionalAPR: _emotionalAPR,
            civicMetric: _civicMetric,
            timestamp: block.timestamp
        }));
    }

    function getPulse(uint _index) public view returns (
        string memory partnerName,
        string memory region,
        string memory emotionalAPR,
        string memory civicMetric,
        uint timestamp
    ) {
        DiplomaticPulse memory p = pulses[_index];
        return (p.partnerName, p.region, p.emotionalAPR, p.civicMetric, p.timestamp);
    }

    function totalPulses() public view returns (uint) {
        return pulses.length;
    }
}
