// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ProductionAlliance - Ritual contract for sovereign factory partnerships across nations
/// @author Vinvin
/// @notice Encodes agreements, factory deployment, and economic revival through collaboration

contract ProductionAlliance {
    address public scrollsmith;

    struct PartnerNation {
        string country;
        string contactPerson;
        bool isActive;
        uint256 factoriesPlanned;
        uint256 factoriesDeployed;
        string focusSector; // e.g. "Textiles", "Electronics", "Food Processing"
        uint256 timestamp;
    }

    mapping(string => PartnerNation) public nations;
    string[] public partnerList;

    event PartnershipFormed(string country, string contactPerson, string sector);
    event FactoryDeployed(string country, uint256 totalDeployed);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Form a production partnership with a nation
    function formPartnership(
        string calldata country,
        string calldata contactPerson,
        uint256 factoriesPlanned,
        string calldata focusSector
    ) external onlyScrollsmith {
        require(!nations[country].isActive, "Already partnered");

        nations[country] = PartnerNation(
            country,
            contactPerson,
            true,
            factoriesPlanned,
            0,
            focusSector,
            block.timestamp
        );

        partnerList.push(country);
        emit PartnershipFormed(country, contactPerson, focusSector);
    }

    /// @notice Deploy a factory in a partnered nation
    function deployFactory(string calldata country) external onlyScrollsmith {
        PartnerNation storage nation = nations[country];
        require(nation.isActive, "Not partnered");
        require(nation.factoriesDeployed < nation.factoriesPlanned, "All factories deployed");

        nation.factoriesDeployed += 1;
        emit FactoryDeployed(country, nation.factoriesDeployed);
    }

    /// @notice View all partnered nations
    function getPartnerList() external view returns (string[] memory) {
        return partnerList;
    }

    /// @notice View details of a partnered nation
    function getNation(string calldata country) external view returns (PartnerNation memory) {
        return nations[country];
    }
}
