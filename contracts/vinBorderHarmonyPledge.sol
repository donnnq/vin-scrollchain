contract vinBorderHarmonyPledge {
    address public pledgeInitiator;
    string public unifiedIntent = "Peace, Equality, Restoration";

    struct BorderPromise {
        bool agreementReached;
        bool dignityUpheld;
        string pledgeMessage;
    }

    mapping(string => BorderPromise) public countryPledges;
    event TreatyVow(string region, string vow, address witness);
    event EqualTreatmentActivated(string region, bool confirmed);

    constructor() {
        pledgeInitiator = msg.sender;
    }

    function vowPeace(string memory _region, string memory _message) public {
        countryPledges[_region] = BorderPromise(true, true, _message);
        emit TreatyVow(_region, _message, msg.sender);
    }

    function activateEquality(string memory _region) public {
        require(countryPledges[_region].agreementReached, "No agreement yet.");
        emit EqualTreatmentActivated(_region, true);
    }

    function getPledge(string memory _region) public view returns (string memory) {
        return countryPledges[_region].pledgeMessage;
    }
}
