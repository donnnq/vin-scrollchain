// SPDX-License-Identifier: Civic-OS-Global-APR-Oracle-2025
pragma solidity ^0.8.19;

/**
 * @title vinGlobalAPROracle
 * @author Vinvin
 * @notice Tracks emotional APR metrics across sovereign partners for planetary resonance
 */

contract vinGlobalAPROracle {

    address public stewardCouncil;

    struct APRMetric {
        string partnerName;
        string region;
        uint trust;
        uint dignity;
        uint mythicClarity;
        uint timestamp;
    }

    APRMetric[] public metrics;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only steward council may log APR metrics");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function logAPR(
        string memory _partnerName,
        string memory _region,
        uint _trust,
        uint _dignity,
        uint _mythicClarity
    ) public onlyCouncil {
        metrics.push(APRMetric({
            partnerName: _partnerName,
            region: _region,
            trust: _trust,
            dignity: _dignity,
            mythicClarity: _mythicClarity,
            timestamp: block.timestamp
        }));
    }

    function getAPR(uint _index) public view returns (
        string memory partnerName,
        string memory region,
        uint trust,
        uint dignity,
        uint mythicClarity,
        uint timestamp
    ) {
        APRMetric memory m = metrics[_index];
        return (
            m.partnerName,
            m.region,
            m.trust,
            m.dignity,
            m.mythicClarity,
            m.timestamp
        );
    }

    function totalMetrics() public view returns (uint) {
        return metrics.length;
    }

    function averageAPR() public view returns (
        uint avgTrust,
        uint avgDignity,
        uint avgMythicClarity
    ) {
        uint totalTrust;
        uint totalDignity;
        uint totalClarity;
        uint count = metrics.length;

        for (uint i = 0; i < count; i++) {
            totalTrust += metrics[i].trust;
            totalDignity += metrics[i].dignity;
            totalClarity += metrics[i].mythicClarity;
        }

        if (count == 0) {
            return (0, 0, 0);
        }

        return (
            totalTrust / count,
            totalDignity / count,
            totalClarity / count
        );
    }
}
