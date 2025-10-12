// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MadeInUSA_CryptoTaxDAO
 * @dev Emotionally tagged smart contract to log crypto project origin,
 * tax classification, and sovereignty status — scrollchain-sealed clarity.
 */

contract MadeInUSA_CryptoTaxDAO {
    address public steward;

    struct CryptoProject {
        address initiator;
        string projectName;
        string originCountry;
        bool isTaxExempt;
        string emotionalTag;
        uint256 timestamp;
    }

    CryptoProject[] public projects;

    event CryptoTaxStatusLogged(address indexed initiator, string projectName, string originCountry, bool isTaxExempt, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log crypto tax status");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProject(address initiator, string memory projectName, string memory originCountry, bool isTaxExempt, string memory emotionalTag) external onlySteward {
        projects.push(CryptoProject({
            initiator: initiator,
            projectName: projectName,
            originCountry: originCountry,
            isTaxExempt: isTaxExempt,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CryptoTaxStatusLogged(initiator, projectName, originCountry, isTaxExempt, emotionalTag, block.timestamp);
    }

    function getProjectByIndex(uint256 index) external view returns (address initiator, string memory projectName, string memory originCountry, bool isTaxExempt, string memory emotionalTag, uint256 timestamp) {
        require(index < projects.length, "Scrollstorm index out of bounds");
        CryptoProject memory p = projects[index];
        return (p.initiator, p.projectName, p.originCountry, p.isTaxExempt, p.emotionalTag, p.timestamp);
    }
}
