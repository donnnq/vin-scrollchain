// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinConsentLayer {
    mapping(address => bool) public grantedAccess;
    event AccessGranted(address entity);

    function grantConsent(address entity, bool consent) public {
        require(consent, "Consent required");
        grantedAccess[entity] = true;
        emit AccessGranted(entity);
    }
}
