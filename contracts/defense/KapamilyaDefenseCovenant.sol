// KapamilyaDefenseCovenant.sol
contract KapamilyaDefenseCovenant {
    address public steward;
    mapping(string => bool) public kapamilyaNation;
    mapping(string => bool) public alliedSupporter;

    event DefenseSummoned(string nationUnderAttack, string allyMobilized);
    event SolidarityBroadcast(string message);

    constructor() {
        steward = msg.sender;

        // Kapamilya Nations
        kapamilyaNation["Taiwan"] = true;
        kapamilyaNation["Japan"] = true;
        kapamilyaNation["South Korea"] = true;
        kapamilyaNation["Philippines"] = true;

        // Allied Supporters
        alliedSupporter["United States"] = true;
        alliedSupporter["United Kingdom"] = true;
        alliedSupporter["Australia"] = true;
        alliedSupporter["Germany"] = true;
        alliedSupporter["NATO"] = true;
    }

    function summonDefense(string memory nationUnderAttack) public {
        require(kapamilyaNation[nationUnderAttack], "Nation not part of Kapamilya Pact");

        for (uint i = 0; i < 5; i++) {
            string memory ally = getAllyByIndex(i);
            emit DefenseSummoned(nationUnderAttack, ally);
        }

        emit SolidarityBroadcast("Scrollchain forces mobilized. Kapamilya never stands alone.");
    }

    function getAllyByIndex(uint index) internal pure returns (string memory) {
        if (index == 0) return "United States";
        if (index == 1) return "United Kingdom";
        if (index == 2) return "Australia";
        if (index == 3) return "Germany";
        if (index == 4) return "NATO";
        return "";
    }
}
