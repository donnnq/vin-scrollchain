// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IEmploymentSanctity {
    function isNationBlacklisted(string memory countryCode) external view returns (bool);
    function flaggedIdentities(bytes32 identityHash) external view returns (bool);
}

interface IDeepfakeSentinel {
    function isContentFlagged(bytes32 contentHash) external view returns (bool);
}

interface IVinSanctionHammer {
    function flagActor(address actor, string memory reason) external;
    function revokeAccess(address actor) external;
}

contract vinInfiltrationResponseMatrixV2 {
    address public matrixOracle;
    IVinSanctionHammer public hammer;
    IEmploymentSanctity public sanctityScroll;
    IDeepfakeSentinel public sentinelScroll;

    event CompositeThreatTriggered(address indexed actor, string category);

    modifier onlyOracle() {
        require(msg.sender == matrixOracle, "Not matrix oracle");
        _;
    }

    constructor(
        address _hammer,
        address _sanctityScroll,
        address _sentinelScroll
    ) {
        matrixOracle = msg.sender;
        hammer = IVinSanctionHammer(_hammer);
        sanctityScroll = IEmploymentSanctity(_sanctityScroll);
        sentinelScroll = IDeepfakeSentinel(_sentinelScroll);
    }

    function assessCompositeThreat(
        address actor,
        bytes32 identityHash,
        bytes32 mediaHash,
        string memory countryCode
    ) external onlyOracle {
        bool identityFlagged = sanctityScroll.flaggedIdentities(identityHash);
        bool nationBlacklisted = sanctityScroll.isNationBlacklisted(countryCode);
        bool mediaFlagged = sentinelScroll.isContentFlagged(mediaHash);

        if (identityFlagged && nationBlacklisted) {
            hammer.flagActor(actor, "Blacklisted nation & fraudulent identity");
            hammer.revokeAccess(actor);
            emit CompositeThreatTriggered(actor, "Nation + Identity");
        } else if (mediaFlagged && identityFlagged) {
            hammer.flagActor(actor, "Deepfake + fraudulent identity");
            hammer.revokeAccess(actor);
            emit CompositeThreatTriggered(actor, "Media + Identity");
        } else if (mediaFlagged && nationBlacklisted) {
            hammer.flagActor(actor, "Deepfake content from blacklisted origin");
            hammer.revokeAccess(actor);
            emit CompositeThreatTriggered(actor, "Media + Nation");
        }
    }
}
