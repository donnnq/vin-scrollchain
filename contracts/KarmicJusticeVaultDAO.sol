// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmicJusticeVaultDAO {
    address public admin;

    struct JusticeRecord {
        string accusedEntity;
        string violationType;
        string karmicOutcome;
        string emotionalTag;
        bool archived;
    }

    JusticeRecord[] public records;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRecord(string memory _accusedEntity, string memory _violationType, string memory _karmicOutcome, string memory _emotionalTag) external onlyAdmin {
        records.push(JusticeRecord(_accusedEntity, _violationType, _karmicOutcome, _emotionalTag, false));
    }

    function archiveRecord(uint256 index) external onlyAdmin {
        records[index].archived = true;
    }

    function getRecord(uint256 index) external view returns (JusticeRecord memory) {
        return records[index];
    }
}
