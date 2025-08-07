// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfBlessedSignalRelay {
    address public sovereignCouncil;

    struct Signal {
        string originAsset;
        string destinationAsset;
        string ancestralGlyph;
        string civicResonanceTag;
        bool relayed;
    }

    Signal[] public signals;

    mapping(string => bool) public isSanctifiedAsset;

    event SignalPrepared(uint indexed signalId, string origin, string destination);
    event SignalRelayed(uint indexed signalId, string glyph, string tag);
    event AssetSanctified(string assetName);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function sanctifyAsset(string memory assetName) public onlyCouncil {
        isSanctifiedAsset[assetName] = true;
        emit AssetSanctified(assetName);
    }

    function prepareSignal(
        string memory originAsset,
        string memory destinationAsset,
        string memory ancestralGlyph,
        string memory civicResonanceTag
    ) public onlyCouncil {
        require(isSanctifiedAsset[originAsset], "Origin not sanctified");
        require(isSanctifiedAsset[destinationAsset], "Destination not sanctified");

        signals.push(Signal({
            originAsset: originAsset,
            destinationAsset: destinationAsset,
            ancestralGlyph: ancestralGlyph,
            civicResonanceTag: civicResonanceTag,
            relayed: false
        }));

        emit SignalPrepared(signals.length - 1, originAsset, destinationAsset);
    }

    function relaySignal(uint signalId) public onlyCouncil {
        require(!signals[signalId].relayed, "Already relayed");
        signals[signalId].relayed = true;
        emit SignalRelayed(
            signalId,
            signals[signalId].ancestralGlyph,
            signals[signalId].civicResonanceTag
        );
    }
}
