// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryToFarmLogisticsCodexDAO {
    address public admin;

    struct LogisticsEntry {
        string factoryName;
        string farmRegion;
        string logisticsClause;
        string emotionalTag;
        bool deployed;
    }

    LogisticsEntry[] public logistics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitLogistics(string memory _factoryName, string memory _farmRegion, string memory _logisticsClause, string memory _emotionalTag) external onlyAdmin {
        logistics.push(LogisticsEntry(_factoryName, _farmRegion, _logisticsClause, _emotionalTag, false));
    }

    function deployLogistics(uint256 index) external onlyAdmin {
        logistics[index].deployed = true;
    }

    function getLogistics(uint256 index) external view returns (LogisticsEntry memory) {
        return logistics[index];
    }
}
