// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateInfrastructureYouthDesignDAO {
    address public steward;

    struct DesignEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string designConcept;
        string emotionalTag;
    }

    DesignEntry[] public registry;

    event YouthDesignLogged(string name, string schoolOrBarangay, string timestamp, string designConcept, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDesign(
        string memory name,
        string memory schoolOrBarangay,
        string memory timestamp,
        string memory designConcept,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DesignEntry(name, schoolOrBarangay, timestamp, designConcept, emotionalTag));
        emit YouthDesignLogged(name, schoolOrBarangay, timestamp, designConcept, emotionalTag);
    }
}
