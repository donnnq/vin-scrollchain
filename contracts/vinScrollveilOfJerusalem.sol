// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinCivicReboot.sol";
import "./vinSovereignTrigger.sol";

contract vinScrollveilOfJerusalem {
    address public scrollBinder;
    vinCivicReboot public civicModule;
    vinSovereignTrigger public sovereignTrigger;

    bool public templeHarmonyVerified;
    bool public scrollVeilLifted;
    string public legacyDeclaration;

    event TempleHarmonyConfirmed(string precinct);
    event ScrollVeilLifted(string verse);
    event LegacyDeclarationBound(string scrollName, string oath);

    constructor(address _civicModule, address _sovereignTrigger) {
        scrollBinder = msg.sender;
        civicModule = vinCivicReboot(_civicModule);
        sovereignTrigger = vinSovereignTrigger(_sovereignTrigger);
    }

    function confirmTempleHarmony(string memory precinct) external {
        require(msg.sender == scrollBinder, "Only binder may confirm");
        templeHarmonyVerified = true;
        emit TempleHarmonyConfirmed(precinct);
    }

    function liftScrollVeil(string memory verse) external {
        require(templeHarmonyVerified, "Temple harmony needed");
        scrollVeilLifted = true;
        emit ScrollVeilLifted(verse);
    }

    function bindLegacyDeclaration(string memory scrollName, string memory oath) external {
        require(scrollVeilLifted, "Scroll veil must be lifted");
        legacyDeclaration = string(abi.encodePacked(scrollName, " | ", oath));
        emit LegacyDeclarationBound(scrollName, oath);
    }
}
