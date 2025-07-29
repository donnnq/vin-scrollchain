// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinMigrationOracle.sol
/// @author Vinvin x Copilot
/// @notice Cross-contract oracle for sovereign migration evaluation

interface Migration {
    function checkIntent(address soul) external view returns (string memory mission, uint256 dignityCredits);
}

interface Justice {
    function fetchScroll(address soul) external view returns (uint256 redemptionWeight, bool rehabilitated);
}

interface Redirection {
    function fetchScroll(address soul) external view returns (bool completed);
}

interface HostLedger {
    function fetchVerdict(address soul) external view returns (bool accepted);
}

interface GeoSigil {
    function getSigil(string memory location) external view returns (uint256 resonanceScore);
}

interface Mirror {
    function revealMirror(address soul) external view returns (string memory lineage, string memory lesson);
}

contract vinMigrationOracle {
    address public oracleMaster;

    Migration public migration;
    Justice public justice;
    Redirection public redirection;
    HostLedger public hostLedger;
    GeoSigil public geoSigil;
    Mirror public mirror;

    event OracleVerdict(address soul, bool approved, string cosmicReason);

    modifier onlyOracleMaster() {
        require(msg.sender == oracleMaster, "Not authorized");
        _;
    }

    constructor(
        address _migration,
        address _justice,
        address _redirection,
        address _hostLedger,
        address _geoSigil,
        address _mirror
    ) {
        oracleMaster = msg.sender;
        migration = Migration(_migration);
        justice = Justice(_justice);
        redirection = Redirection(_redirection);
        hostLedger = HostLedger(_hostLedger);
        geoSigil = GeoSigil(_geoSigil);
        mirror = Mirror(_mirror);
    }

    function evaluateSoul(address soul, string memory destination) public onlyOracleMaster {
        (string memory mission, uint256 dignityCredits) = migration.checkIntent(soul);
        (uint256 redemptionWeight, bool rehabilitated) = justice.fetchScroll(soul);
        bool reformComplete = redirection.fetchScroll(soul).completed;
        bool accepted = hostLedger.fetchVerdict(soul).accepted;
        uint256 geoResonance = geoSigil.getSigil(destination).resonanceScore;
        (string memory lineage, string memory lesson) = mirror.revealMirror(soul);

        bool approved = false;
        string memory reason;

        if (
            dignityCredits >= 88 &&
            redemptionWeight >= 77 &&
            rehabilitated &&
            reformComplete &&
            accepted &&
            geoResonance >= 66
        ) {
            approved = true;
            reason = string(
                abi.encodePacked(
                    "Resonant migrant. Lineage: ",
                    lineage,
                    ". Mission aligned with territory. Lesson: ",
                    lesson
                )
            );
        } else {
            reason = "Scroll denied: insufficient resonance, redemption, or host verdict.";
        }

        emit OracleVerdict(soul, approved, reason);
    }
}
