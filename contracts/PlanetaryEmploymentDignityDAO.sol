// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryEmploymentDignityDAO {
    address public admin;

    struct DignityEntry {
        string workerName;
        string employmentContext;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDignity(string memory workerName, string memory employmentContext, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(workerName, employmentContext, emotionalTag, true, false));
    }

    function protectDignity(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
