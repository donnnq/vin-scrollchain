// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinContractorExposureScroll {
    struct Contractor {
        string name;
        uint dpwhRank;
        string controllingEntity;
        string[] lgusAffected;
        bool floodImpactVerified;
    }

    Contractor[] public contractors;

    event ContractorLogged(string name, uint rank, string entity);

    function logContractor(
        string memory name,
        uint rank,
        string memory entity,
        string[] memory lgus,
        bool impactVerified
    ) public {
        contractors.push(Contractor(name, rank, entity, lgus, impactVerified));
        emit ContractorLogged(name, rank, entity);
    }

    function getContractor(uint index) public view returns (Contractor memory) {
        return contractors[index];
    }
}
