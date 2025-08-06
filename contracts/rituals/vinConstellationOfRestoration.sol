// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinConstellationOfRestoration {
    address public sovereignCouncil;

    struct Scroll {
        string name;
        string domain;
        string ancestralGuardian;
        string civicSigil;
        bool activated;
    }

    Scroll[] public scrolls;

    event ScrollRegistered(uint indexed scrollId, string name, string domain);
    event ScrollActivated(uint indexed scrollId, string guardian, string sigil);
    event ConstellationPulse(string message, uint timestamp);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function registerScroll(
        string memory name,
        string memory domain
    ) public onlyCouncil {
        scrolls.push(Scroll({
            name: name,
            domain: domain,
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

    function pulseConstellation(string memory message) public onlyCouncil {
        emit ConstellationPulse(message, block.timestamp);
    }
}
