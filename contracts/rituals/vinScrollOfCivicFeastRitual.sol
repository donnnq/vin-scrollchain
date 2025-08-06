// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfCivicFeastRitual {
    address public sovereignCouncil;

    struct Feast {
        string zoneName;
        string country;
        string occasion;
        string ancestralInvocation;
        string civicGratitudeRite;
        uint participantCount;
        bool completed;
    }

    Feast[] public feasts;

    event FeastDeclared(uint indexed feastId, string zoneName, string occasion);
    event InvocationBound(uint indexed feastId, string invocation);
    event GratitudeRiteAssigned(uint indexed feastId, string rite);
    event FeastCompleted(uint indexed feastId, uint participantCount);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function declareFeast(
        string memory zoneName,
        string memory country,
        string memory occasion
    ) public onlyCouncil {
        feasts.push(Feast({
            zoneName: zoneName,
            country: country,
            occasion: occasion,
            ancestralInvocation: "",
            civicGratitudeRite: "",
            participantCount: 0,
            completed: false
        }));
        emit FeastDeclared(feasts.length - 1, zoneName, occasion);
    }

    function bindInvocation(uint feastId, string memory invocation) public onlyCouncil {
        feasts[feastId].ancestralInvocation = invocation;
        emit InvocationBound(feastId, invocation);
    }

    function assignGratitudeRite(uint feastId, string memory rite) public onlyCouncil {
        feasts[feastId].civicGratitudeRite = rite;
        emit GratitudeRiteAssigned(feastId, rite);
    }

    function completeFeast(uint feastId, uint participantCount) public onlyCouncil {
        require(!feasts[feastId].completed, "Already completed");
        feasts[feastId].participantCount = participantCount;
        feasts[feastId].completed = true;
        emit FeastCompleted(feastId, participantCount);
    }
}
