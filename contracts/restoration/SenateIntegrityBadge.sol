// SPDX-License-Identifier: Civic-Honor
pragma solidity ^0.8.0;

/// @title SenateIntegrityBadge
/// @notice Mints honor badges for senators who pass civic drug testing

contract SenateIntegrityBadge {
    address public badgeIssuer;
    mapping(address => bool) public eligibleSenators;
    mapping(address => bool) public mintedBadges;

    event BadgeMinted(address senator);
    event EligibilityUpdated(address senator, bool status);

    constructor(address _issuer) {
        badgeIssuer = _issuer;
    }

    function updateEligibility(address senator, bool status) public {
        require(msg.sender == badgeIssuer, "Unauthorized issuer");
        eligibleSenators[senator] = status;
        emit EligibilityUpdated(senator, status);
    }

    function mintBadge(address senator) public {
        require(msg.sender == badgeIssuer, "Only issuer can mint");
        require(eligibleSenators[senator], "Senator not eligible");
        require(!mintedBadges[senator], "Badge already minted");

        mintedBadges[senator] = true;
        emit BadgeMinted(senator);
    }

    function hasBadge(address senator) public view returns (bool) {
        return mintedBadges[senator];
    }
}
