// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformTipTransparencyCodex {
    address public steward;

    struct TipClause {
        string platformName;
        string tipPolicy;
        string transparencyStatus;
        string emotionalTag;
    }

    TipClause[] public codex;

    event TipTransparencyLogged(string platformName, string tipPolicy, string transparencyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logTipTransparency(
        string memory platformName,
        string memory tipPolicy,
        string memory transparencyStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TipClause(platformName, tipPolicy, transparencyStatus, emotionalTag));
        emit TipTransparencyLogged(platformName, tipPolicy, transparencyStatus, emotionalTag);
    }
}
