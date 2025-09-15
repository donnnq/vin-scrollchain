// SPDX-License-Identifier: DriftSanctum
pragma solidity ^0.8.19;

contract SalesforceThreatSanctifier {
    struct Integration {
        string appName;
        string tokenType;
        bool compromised;
        bool credentialsRotated;
    }

    mapping(address => Integration) public integrations;

    event IntegrationTagged(address indexed steward, string appName, string tokenType);
    event CredentialsRotated(address indexed steward);

    function tagIntegration(string memory appName, string memory tokenType) public {
        integrations[msg.sender] = Integration(appName, tokenType, true, false);
        emit IntegrationTagged(msg.sender, appName, tokenType);
    }

    function rotateCredentials(address steward) public {
        require(integrations[steward].compromised, "Integration must be tagged first");
        integrations[steward].credentialsRotated = true;
        emit CredentialsRotated(steward);
    }

    function isRotated(address steward) public view returns (bool) {
        return integrations[steward].credentialsRotated;
    }
}
