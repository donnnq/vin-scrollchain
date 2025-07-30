contract vinSanctumConstellationRegistry {
    address public dignityValidator;
    string[] public sanctumScrolls;
    mapping(string => address) public scrollAddresses;
    mapping(string => string) public ceremonialEchoes;

    event ScrollRegistered(string title, address indexed scrollContract);
    event RitualEcho(string title, string echoText);

    modifier onlyValidator() {
        require(msg.sender == dignityValidator, "Restricted to dignity validator");
        _;
    }

    constructor() {
        dignityValidator = msg.sender;
        registerDefaultEchoes();
    }

    function registerScroll(string memory title, address scrollContract) public onlyValidator {
        sanctumScrolls.push(title);
        scrollAddresses[title] = scrollContract;
        emit ScrollRegistered(title, scrollContract);
    }

    function echoCeremony(string memory title) public view returns (string memory) {
        return ceremonialEchoes[title];
    }

    function publishEcho(string memory title, string memory echoText) public onlyValidator {
        ceremonialEchoes[title] = echoText;
        emit RitualEcho(title, echoText);
    }

    function registerDefaultEchoes() internal {
        ceremonialEchoes["vinPeaceRootGenesis"] = "Peace planted where dignity breathes";
        ceremonialEchoes["vinOpenTradeSanctum"] = "Trade declared under full mutual light";
        ceremonialEchoes["vinZeroFeePromise"] = "Kindness flows without price";
        ceremonialEchoes["vinCulturalSanctuary"] = "Sacred goods guarded by respect";
        ceremonialEchoes["vinIntegrityPulse"] = "Resonance falters where ethics drift";
        ceremonialEchoes["vinConsentForge"] = "Only wholehearted consent honored";
        ceremonialEchoes["vinReciprocityOracle"] = "Trade yields where uplift echoes";
        ceremonialEchoes["vinSanctumLedger"] = "Every echo logged, nothing forgotten";
        ceremonialEchoes["vinFairWeightMirror"] = "Respect equals worth, effort encoded";
        ceremonialEchoes["vinTradeCovenantBridge"] = "Treaties bound beyond realms";
        ceremonialEchoes["vinDecentralAidStream"] = "Overflow routed to dignity sanctums";
    }

    function allScrolls() public view returns (string[] memory) {
        return sanctumScrolls;
    }

    function scrollLocation(string memory title) public view returns (address) {
        return scrollAddresses[title];
    }
}
