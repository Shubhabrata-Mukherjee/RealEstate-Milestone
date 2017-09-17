pragma solidity^0.4.11;
contract MileStoneTracker{
    address Admin;
    address customer;
    address serviceprovider;
    address onlyowner;
    function MileStoneTracker()
    {
         Admin=msg.sender;
    }
   
    struct Milestone {
         uint256 time;
         uint256 price;
         uint256 service_type;
         bool stats;
          MilestoneStatus status;
          uint doneTime;
           bytes payData;
           uint256 milestone_id;
    }
    
         bytes32 template_type;
         uint256 template_id;
     
    struct service_Provider
    {
         bytes32 name;
         uint256 service_type;
         uint256 phone_no;
         address serviceprovider;
         uint256 serviceProvider_id;
    }
    struct customer_info
    {
         bytes32 name;
         uint256 custservice_type;
         uint256 phone_no;
         address customer;
         uint256 customer_id;
        
    }
    enum MilestoneStatus {
        AcceptedAndInProgress,
        Completed,
        Done,
        AuthorizedForPayment,
        Canceled
    }

  
    bool public campaignCanceled;
    bool public changingMilestones;
    bytes public proposedMilestones;
    
    mapping(address=>Milestone) milestones;
    //mapping(address=>Template[]) temp1;
    mapping(uint256=>string) template_type1;
    mapping(address=>service_Provider)serviceprovide;
    mapping(address =>customer_info)customerr;
    //mapping(uint256=>service_Provider)serviceprovide1;
   // mapping(address=>string[])customers;
    
    
    //modifier campaignNotCanceled { if (campaignCanceled) revert(); _; }
    //modifier notChanging { if (changingMilestones) revert(); _; }
    modifier onlyserviceprovider(){if(msg.sender!=serviceprovider) revert();_;}
    modifier onlyAdmin(){if(msg.sender!=Admin) revert();_;}
    modifier onlyCustomer(){if(msg.sender!=customer) revert();_;}
     
    uint256[] b1;
    bytes32[] c1;
    bool d;
    // for mileStone
    
    
    // for template
    address[] z;
    address[] y;
    address[] x;
    ///
     uint256[] v;
    uint256[] b;
    uint256[] c;
    uint256[] dd;
        /// for sevice
    bytes32[]   vB;
    uint256[]  bB;
    uint256[]  cB;
    address[]  dB;
    uint256[]  vV;
        // //for customer
    bytes32[]  vC;
    uint256[]  bC;
    uint256[]  cC;
    address[]  cD;
    uint256[]  dD;
        
    
    event NewMilestoneListProposed();
    event NewMilestoneListUnproposed();
    event NewMilestoneListAccepted();
    event ProposalStatusChanged(uint idProposal, MilestoneStatus newProposal);
    event CampaignCanceled();
    event check (uint256 a);
    event check1 (bool a);
    
    modifier campaignNotCanceled { if (campaignCanceled) revert(); _; }
    modifier notChanging { if (changingMilestones) revert(); _; }

    // bool public campaignCanceled;
    // bool public changingMilestones;
    // bytes public proposedMilestones;
    
    event NewMilestoneListProposed();
    event NewMilestoneListUnproposed();
    event NewMilestoneListAccepted();
    event ProposalStatusChanged(uint idProposal, MilestoneStatus newProposal);
    event CampaignCanceled();
    
    Milestone[] public milestones1;
    Milestone milestone = milestones1[milestones1.length ++];
    
     function setTemplates(bytes32 _template_type) onlyAdmin
    {
      
             uint256 temp_random = uint256(sha3(block.timestamp)) +1;
             //template_type1[temp_random]=_template_type;
             b1.push(temp_random);
             c1.push(_template_type);
    
    }
    function getTemplate()  constant returns(uint256[],bytes32[]){
        
         return (b1,c1); 
    }
    
    
     function customer1()
    {
        customer=msg.sender;
    }
    
     function setcustomer_info(bytes32[] name,uint256[] _custservice_type,uint256[] _phone_no)
    {
        
        customer_info memory customer1;
            for(uint256 a=0;a<name.length;a++){
             uint256 cust_random = uint256(sha3(block.timestamp));
             customer1.name=name[a];
             customer1.custservice_type=_custservice_type[a];
             customer1.phone_no=_phone_no[a];
             customer1.customer=msg.sender;
             customer1.customer_id=cust_random;
             customerr[msg.sender]=customer1;
             z.push(msg.sender);
            } 
        
    }
    function getcustomer_info() constant returns(bytes32[],uint256[],uint256[],address[],uint256[]){
        
       
    for(uint256 a=0;a<z.length;a++){
      vC.push(customerr[z[a]].name);
      bC.push(customerr[z[a]].custservice_type);
      cC.push(customerr[z[a]].phone_no);
      cD.push(customerr[z[a]].customer);
      dD.push(customerr[z[a]].customer_id);
    }
         return(vC,bC,cC,cD,dD);       
    }
    
    
    function serviceprovider1()
    {
        serviceprovider=msg.sender;
    }
    
    function setServiceProvider(bytes32[] _name,uint256[] _phone_no,uint256[] template_id2) onlyserviceprovider
    {  
        for (uint256 k=0;k<_name.length;k++){
            check(template_id2[k]);
            if(b1[k]!=template_id2[k]){
         check(template_id2[k]);
            revert();
        }
    }
       service_Provider memory s_Provider;
        for(uint256 a=0;a<_name.length;a++){
             uint256 random = uint256(sha3(block.timestamp)) +1;
             s_Provider.name=_name[a];
             s_Provider.service_type=template_id2[a];
             s_Provider.phone_no=_phone_no[a];
             s_Provider.serviceprovider=msg.sender;
             s_Provider.serviceProvider_id=random;
             serviceprovide[msg.sender]=s_Provider;
             y.push(msg.sender);
        }
       
    }
    
    function getServiveProvider() constant returns(bytes32[],uint256[],uint256[],address[],uint256[]){
        
        
        for(uint256 a=0;a<y.length;a++){
            vB.push(serviceprovide[y[a]].name);
            bB.push(serviceprovide[y[a]].service_type);
            cB.push(serviceprovide[y[a]].phone_no);
            dB.push(serviceprovide[y[a]].serviceprovider);
            vV.push(serviceprovide[y[a]].serviceProvider_id);
        }
                 return(vB,bB,cB,dB,vV);

    }
    
    
    function setMilestones(uint256[] _time,uint256[] _price, uint256[] _serviceProviderId)  onlyCustomer
    {
        Milestone memory mile;
        for(uint256 a=0;a<_time.length;a++){
            uint256 random = uint256(sha3(block.timestamp)) +1;
             mile.time=_time[a];
             mile.price=_price[a];
             mile.service_type=_serviceProviderId[a];
             mile.stats=false;
             mile.milestone_id=random;
             milestones[msg.sender]=mile;
             x.push(msg.sender);
            
         //proposedMilestones = _newMilestones;
    }
    }
    function getMilestone() public constant returns (uint256[],uint256[],uint256[],uint256[]) {
       
        for(uint256 a=0;a<x.length;a++){
        v.push(milestones[x[a]].time);
        b.push(milestones[x[a]].price);
        c.push(milestones[x[a]].service_type);
        dd.push(milestones[x[a]].milestone_id);
        }
        return(v,b,c,dd);
    }
    
     function unproposeMilestones(uint256 mile_id) onlyserviceprovider  {
         for(uint256 a=0;a<x.length;a++){
         delete milestones[x[a]];
        }
        delete proposedMilestones;
        changingMilestones = false;
        NewMilestoneListUnproposed();
    }
    
    function approveMilestone(uint256 m_id)  onlyserviceprovider 
    {
        Milestone memory mile;
        for(uint256 a=0;a<x.length;a++){
             if(m_id==milestones[x[a]].milestone_id){
                mile.stats=true;
              ProposalStatusChanged(m_id,MilestoneStatus.AcceptedAndInProgress);     
             check1(mile.stats);
             //check1("MilestoneStatus.AcceptedAndInProgress");
            } 
        }
    
    }
    
    function markMilestoneComplete(uint _idMilestone) onlyserviceprovider 
    {
        for(uint256 a=0;a<x.length;a++){
            if(msg.sender==serviceprovider && _idMilestone==milestones[x[a]].milestone_id){
                milestone.status = MilestoneStatus.Completed;
                ProposalStatusChanged(_idMilestone, milestone.status);
            }
        }
        // if (_idMilestone >= x.length) revert();
        // Milestone milestone = milestones1[_idMilestone];
        // // if (  (msg.sender != milestone.milestoneLeadLink)
        // //     &&(msg.sender != recipient))
        // //     revert();
        // if (milestone.status != MilestoneStatus.AcceptedAndInProgress) revert();
        // if (now < milestones[msg.sender].time) revert();
        // //if (now > milestone.maxCompletionDate) revert();
        // milestone.status = MilestoneStatus.Completed;
        // milestone.doneTime = now;
        // ProposalStatusChanged(_idMilestone, milestone.status);
    }
    
    function approveCompletedMilestone(uint _idMilestone) onlyAdmin
    {   for(uint256 a=0;a<x.length;a++){
            if(msg.sender==Admin && _idMilestone==milestones[x[a]].milestone_id){
                milestone.status = MilestoneStatus.Done;
                ProposalStatusChanged(_idMilestone, milestone.status);
            }
        }
        if (_idMilestone >= milestones1.length) revert();
        Milestone milestone = milestones1[_idMilestone];
        if ((msg.sender != Admin) ||
            (milestone.status != MilestoneStatus.Completed)) revert();

        authorizePayment(_idMilestone);
    }
     function authorizePayment(uint _idMilestone) internal {
        if (_idMilestone >= milestones1.length) revert();
        Milestone milestone = milestones1[_idMilestone];
        // Recheck again to not pay twice
        if (milestone.status == MilestoneStatus.AuthorizedForPayment) revert();
        milestone.status = MilestoneStatus.AuthorizedForPayment;
        //if (!milestone.paymentSource.call.value(0)(milestone.payData))
            revert();
        ProposalStatusChanged(_idMilestone, milestone.status);
    }
}

