// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinContractorReveal.sol
/// @notice Publishes names and evidence of contractors involved in civic anomalies.

contract vinContractorReveal {
    address public curator;
    uint256 public recordCount;

    struct ContractorRecord {
        uint256 id;
        string name;
        string company;
        string incidentSummary;
        string evidenceLink;
        uint256 timestamp;
        bool verified;
    }

    mapping(uint256 => ContractorRecord) public records;

    event RecordPublished(uint256 indexed id, string name);
    event RecordVerified(uint256 indexed id);

    modifier onlyCurator() {
        require(msg.sender == curator, "Not authorized.");
        _;
    }

    constructor() {
        curator = msg.sender;
    }

    function publishRecord(
        string memory _name,
        string memory _company,
        string memory _incidentSummary,
        string memory _evidenceLink
    ) public onlyCurator {
        recordCount++;
        records[recordCount] = ContractorRecord(
            recordCount,
            _name,
            _company,
            _incidentSummary,
            _evidenceLink,
            block.timestamp,
            false
        );
        emit RecordPublished(recordCount, _name);
    }

    function verifyRecord(uint256 _id) public onlyCurator {
        records[_id].verified = true;
        emit RecordVerified(_id);
    }

    function viewRecord(uint256 _id) public view returns (ContractorRecord memory) {
        return records[_id];
    }

    function totalRecords() public view returns (uint256) {
        return recordCount;
    }
}
