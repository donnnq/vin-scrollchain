// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract DueProcessVault {
    address public steward;

    struct LegalVow {
        string caseId;
        string jurisdiction;
        string vowText;
        uint256 timestamp;
    }

    struct RestorationLog {
        string caseId;
        string actionTaken;
        string restoredBy;
        uint256 timestamp;
    }

    mapping(string => LegalVow) public vows;
    mapping(string => RestorationLog[]) public restorations;
    string[] public archivedCases;

    event VowDeclared(string indexed caseId, string jurisdiction, string vow);
    event RestorationLogged(string indexed caseId, string action, string restoredBy);

    constructor() {
        steward = msg.sender;
    }

    function declareVow(string memory caseId, string memory jurisdiction, string memory vowText) public {
        require(msg.sender == steward, "Only steward can declare");

        vows[caseId] = LegalVow({
            caseId: caseId,
            jurisdiction: jurisdiction,
            vowText: vowText,
            timestamp: block.timestamp
        });

        archivedCases.push(caseId);
        emit VowDeclared(caseId, jurisdiction, vowText);
    }

    function logRestoration(string memory caseId, string memory action, string memory restoredBy) public {
        require(msg.sender == steward, "Only steward can log");

        restorations[caseId].push(RestorationLog({
            caseId: caseId,
            actionTaken: action,
            restoredBy: restoredBy,
            timestamp: block.timestamp
        }));

        emit RestorationLogged(caseId, action, restoredBy);
    }

    function getVow(string memory caseId) public view returns (LegalVow memory) {
        return vows[caseId];
    }

    function getRestorations(string memory caseId) public view returns (RestorationLog[] memory) {
        return restorations[caseId];
    }

    function getArchivedCases() public view returns (string[] memory) {
        return archivedCases;
    }
}
