// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinAuditBeacon {
    struct Beacon {
        string region;
        string contractorName;
        string anomalyType;
        string evidenceHash;
        uint timestamp;
        address signaler;
    }

    Beacon[] public auditSignals;

    event BeaconLit(string region, string contractor, string anomalyType);

    function lightBeacon(
        string memory region,
        string memory contractorName,
        string memory anomalyType,
        string memory evidenceHash
    ) public {
        auditSignals.push(Beacon({
            region: region,
            contractorName: contractorName,
            anomalyType: anomalyType,
            evidenceHash: evidenceHash,
            timestamp: block.timestamp,
            signaler: msg.sender
        }));

        emit BeaconLit(region, contractorName, anomalyType);
    }

    function getBeacon(uint index) public view returns (
        string memory, string memory, string memory, string memory, uint, address
    ) {
        Beacon memory b = auditSignals[index];
        return (
            b.region,
            b.contractorName,
            b.anomalyType,
            b.evidenceHash,
            b.timestamp,
            b.signaler
        );
    }

    function totalBeacons() public view returns (uint) {
        return auditSignals.length;
    }
}
