// SPDX-License-Identifier: Mythic-Trust
pragma solidity ^0.8.20;

contract TrustSanctum {
    address public steward;
    mapping(address => bool) public trustedEntities;
    event TrustGranted(address entity);
    event TrustRevoked(address entity);

    constructor() {
        steward = msg.sender;
        trustedEntities[steward] = true;
        emit TrustGranted(steward);
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function grantTrust(address entity) external onlySteward {
        trustedEntities[entity] = true;
        emit TrustGranted(entity);
    }

    function revokeTrust(address entity) external onlySteward {
        trustedEntities[entity] = false;
        emit TrustRevoked(entity);
    }

    function isTrusted(address entity) external view returns (bool) {
        return trustedEntities[entity];
    }
}
