// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfRebuildBlessings {
    address public sovereignCouncil;

    struct Blessing {
        string country;
        string assetName;
        string invocation;
        string ancestralGuardian;
        string civicSigil;
        bool sanctified;
    }

    Blessing[] public blessings;

    event BlessingInvoked(uint indexed blessingId, string assetName, string invocation);
    event GuardianBound(uint indexed blessingId, string guardian);
    event SigilAssigned(uint indexed blessingId, string sigil);
    event SanctificationCompleted(uint indexed blessingId);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function invokeBlessing(
        string memory country,
        string memory assetName,
        string memory invocation
    ) public onlyCouncil {
        blessings.push(Blessing({
            country: country,
            assetName: assetName,
            invocation: invocation,
            ancestralGuardian: "",
            civicSigil: "",
            sanctified: false
        }));
        emit BlessingInvoked(blessings.length - 1, assetName, invocation);
    }

    function bindGuardian(uint blessingId, string memory guardian) public onlyCouncil {
        blessings[blessingId].ancestralGuardian = guardian;
        emit GuardianBound(blessingId, guardian);
    }

    function assignSigil(uint blessingId, string memory sigil) public onlyCouncil {
        blessings[blessingId].civicSigil = sigil;
        emit SigilAssigned(blessingId, sigil);
    }

    function completeSanctification(uint blessingId) public onlyCouncil {
        require(!blessings[blessingId].sanctified, "Already sanctified");
        blessings[blessingId].sanctified = true;
        emit SanctificationCompleted(blessingId);
    }
}
