// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ContractorStyleOracle {
    address public steward;

    enum StyleGrade { Undefined, Basic, Inspired, Mythic }

    struct StyleProfile {
        string styleName;
        StyleGrade grade;
        string aiIntegrationTip;
        bool isLocal;
    }

    mapping(address => StyleProfile) public contractorStyles;

    event StyleEvaluated(address indexed contractor, string styleName, StyleGrade grade, string aiTip, bool isLocal);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function evaluateStyle(
        address contractor,
        string memory styleName,
        StyleGrade grade,
        string memory aiTip,
        bool isLocal
    ) public onlySteward {
        contractorStyles[contractor] = StyleProfile(styleName, grade, aiTip, isLocal);
        emit StyleEvaluated(contractor, styleName, grade, aiTip, isLocal);
    }

    function getStyleProfile(address contractor) public view returns (StyleProfile memory) {
        return contractorStyles[contractor];
    }
}
