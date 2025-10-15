// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalApprenticeshipEquityPackDAO {
    address public admin;

    struct ApprenticeshipEntry {
        string region;
        string sector;
        string equityClause;
        string emotionalTag;
        bool deployed;
    }

    ApprenticeshipEntry[] public apprenticeships;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitApprenticeship(string memory _region, string memory _sector, string memory _equityClause, string memory _emotionalTag) external onlyAdmin {
        apprenticeships.push(AppreciateshipEntry(_region, _sector, _equityClause, _emotionalTag, false));
    }

    function deployApprenticeship(uint256 index) external onlyAdmin {
        apprenticeships[index].deployed = true;
    }

    function getApprenticeship(uint256 index) external view returns (ApprenticeshipEntry memory) {
        return apprenticeships[index];
    }
}
