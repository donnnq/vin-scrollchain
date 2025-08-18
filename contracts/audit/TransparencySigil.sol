// SPDX-License-Identifier: Civic-Honor
pragma solidity ^0.8.0;

/// @title TransparencySigil
/// @author Vinvin
/// @notice Mints civic badges for agencies that pass lump sum audits with full clarity

contract TransparencySigil {
    address public sigilIssuer;
    mapping(string => bool) public eligibleAgencies;
    mapping(string => bool) public mintedSigils;

    event SigilMinted(string agency);
    event EligibilityUpdated(string agency, bool status);

    constructor(address _issuer) {
        sigilIssuer = _issuer;
    }

    function updateEligibility(string memory agency, bool status) public {
        require(msg.sender == sigilIssuer, "Unauthorized issuer");
        eligibleAgencies[agency] = status;
        emit EligibilityUpdated(agency, status);
    }

    function mintSigil(string memory agency) public {
        require(msg.sender == sigilIssuer, "Only issuer can mint");
        require(eligibleAgencies[agency], "Agency not eligible");
        require(!mintedSigils[agency], "Sigil already minted");

        mintedSigils[agency] = true;
        emit SigilMinted(agency);
    }

    function hasSigil(string memory agency) public view returns (bool) {
        return mintedSigils[agency];
    }
}
