// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollChainManifest {
    address public sovereignCouncil;

    struct ScrollMetadata {
        string name;
        string domain;
        string purpose;
        string ancestralGuardian;
        string civicSigil;
        bool activated;
    }

    ScrollMetadata[] public scrolls;

    event ScrollRegistered(uint indexed scrollId, string name, string domain);
    event ScrollActivated(uint indexed scrollId, string guardian, string sigil);
    event ScrollPurposeUpdated(uint indexed scrollId, string purpose);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function registerScroll(
        string memory name,
        string memory domain,
        string memory purpose
    ) public onlyCouncil {
        scrolls.push(ScrollMetadata({
            name: name,
            domain: domain,
            purpose: purpose,
            ancestralGuardian: "",
            civicSigil: "",
            activated: false
        }));
        emit ScrollRegistered(scrolls.length - 1, name, domain);
    }

    function activateScroll(
        uint scrollId,
        string memory guardian,
        string memory sigil
    ) public onlyCouncil {
        require(!scrolls[scrollId].activated, "Already activated");
        scrolls[scrollId].ancestralGuardian = guardian;
        scrolls[scrollId].civicSigil = sigil;
        scrolls[scrollId].activated = true;
        emit ScrollActivated(scrollId, guardian, sigil);
    }

    function updatePurpose(uint scrollId, string memory newPurpose) public onlyCouncil {
        scrolls[scrollId].purpose = newPurpose;
        emit ScrollPurposeUpdated(scrollId, newPurpose);
    }
}
