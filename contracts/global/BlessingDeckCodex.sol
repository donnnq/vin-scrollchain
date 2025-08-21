// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

import "./BlessingDeckOpsCenter.sol";
import "./BlessingDeckStewardPulse.sol";
import "./BlessingDeckResonanceMap.sol";
import "./BlessingDeckSanctumVault.sol";
import "./BlessingDeckGenesisManifest.sol";
import "./BlessingDeckStewardSigil.sol";

contract BlessingDeckCodex {
    BlessingDeckOpsCenter public ops;
    BlessingDeckStewardPulse public pulse;
    BlessingDeckResonanceMap public map;
    BlessingDeckSanctumVault public vault;
    BlessingDeckGenesisManifest public manifest;
    BlessingDeckStewardSigil public sigil;

    constructor(
        address _ops,
        address _pulse,
        address _map,
        address _vault,
        address _manifest,
        address _sigil
    ) {
        ops = BlessingDeckOpsCenter(_ops);
        pulse = BlessingDeckStewardPulse(_pulse);
        map = BlessingDeckResonanceMap(_map);
        vault = BlessingDeckSanctumVault(_vault);
        manifest = BlessingDeckGenesisManifest(_manifest);
        sigil = BlessingDeckStewardSigil(_sigil);
    }

    function getCodexSummary(string memory _steward) public view returns (
        uint256 aprScore,
        uint256 blessingsReceived,
        uint256 scansTriggered,
        string memory sigilHash
    ) {
        BlessingDeckStewardPulse.StewardPulse memory p = pulse.getPulse(_steward);
        BlessingDeckStewardSigil.StewardSigil memory s = sigil.getSigil(_steward);
        return (p.aprScore, p.blessingsReceived, p.scansTriggered, s.sigilHash);
    }
}
