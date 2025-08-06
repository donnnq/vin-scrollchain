// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfSanctifiedHarvest {
    address public sovereignCouncil;

    struct Harvest {
        string farmName;
        string country;
        string cropType;
        uint quantity;
        string ancestralGlyph;
        string civicSigil;
        bool sanctified;
        bool dispatched;
    }

    Harvest[] public harvests;

    event HarvestLogged(uint indexed harvestId, string farmName, string cropType);
    event HarvestSanctified(uint indexed harvestId, string glyph, string sigil);
    event HarvestDispatched(uint indexed harvestId, string destinationNode);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function logHarvest(
        string memory farmName,
        string memory country,
        string memory cropType,
        uint quantity
    ) public onlyCouncil {
        harvests.push(Harvest({
            farmName: farmName,
            country: country,
            cropType: cropType,
            quantity: quantity,
            ancestralGlyph: "",
            civicSigil: "",
            sanctified: false,
            dispatched: false
        }));
        emit HarvestLogged(harvests.length - 1, farmName, cropType);
    }

    function sanctifyHarvest(uint harvestId, string memory glyph, string memory sigil) public onlyCouncil {
        require(!harvests[harvestId].sanctified, "Already sanctified");
        harvests[harvestId].ancestralGlyph = glyph;
        harvests[harvestId].civicSigil = sigil;
        harvests[harvestId].sanctified = true;
        emit HarvestSanctified(harvestId, glyph, sigil);
    }

    function dispatchHarvest(uint harvestId, string memory destinationNode) public onlyCouncil {
        require(harvests[harvestId].sanctified, "Harvest not sanctified");
        require(!harvests[harvestId].dispatched, "Already dispatched");
        harvests[harvestId].dispatched = true;
        emit HarvestDispatched(harvestId, destinationNode);
    }
}
