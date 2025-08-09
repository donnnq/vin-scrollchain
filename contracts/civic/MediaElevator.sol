// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MediaElevator - Ritual scroll for upgrading media companies and boosting journalist rewards
/// @author Vinvin
/// @notice Optimizes media operations and increases salaries based on clarity impact

contract MediaElevator {
    address public scrollsmith;

    struct MediaCompany {
        string name;
        uint256 clarityScore;
        uint256 baseSalary;
        uint256 optimizedSalary;
        bool upgraded;
    }

    MediaCompany[] public companies;

    event CompanyUpgraded(string name, uint256 optimizedSalary);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a media company
    function registerCompany(string calldata name, uint256 baseSalary) external onlyScrollsmith {
        companies.push(MediaCompany(name, 0, baseSalary, baseSalary, false));
    }

    /// @notice Upgrade a company based on clarity score
    function upgradeCompany(uint256 companyId, uint256 clarityBoost) external onlyScrollsmith {
        require(companyId < companies.length, "Invalid ID");
        MediaCompany storage company = companies[companyId];
        company.clarityScore += clarityBoost;
        company.optimizedSalary = company.baseSalary + (clarityBoost * 100);
        company.upgraded = true;
        emit CompanyUpgraded(company.name, company.optimizedSalary);
    }

    /// @notice View all companies
    function getAllCompanies() external view returns (MediaCompany[] memory) {
        return companies;
    }
}
